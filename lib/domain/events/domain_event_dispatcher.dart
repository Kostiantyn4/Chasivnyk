import 'dart:async';
import 'domain_event.dart';

/// Handler function type for domain events
typedef DomainEventHandler<T extends DomainEvent> = Future<void> Function(T event);

/// Dispatcher for domain events following the Observer pattern
class DomainEventDispatcher {
  static final DomainEventDispatcher _instance = DomainEventDispatcher._internal();
  factory DomainEventDispatcher() => _instance;
  DomainEventDispatcher._internal();

  final Map<Type, List<DomainEventHandler>> _handlers = {};
  final StreamController<DomainEvent> _eventStream = StreamController<DomainEvent>.broadcast();

  /// Stream of all domain events
  Stream<DomainEvent> get eventStream => _eventStream.stream;

  /// Register a handler for a specific event type
  void register<T extends DomainEvent>(DomainEventHandler<T> handler) {
    final eventType = T;
    _handlers.putIfAbsent(eventType, () => []);
    _handlers[eventType]!.add(handler as DomainEventHandler);
  }

  /// Unregister a handler for a specific event type
  void unregister<T extends DomainEvent>(DomainEventHandler<T> handler) {
    final eventType = T;
    _handlers[eventType]?.remove(handler);
    if (_handlers[eventType]?.isEmpty == true) {
      _handlers.remove(eventType);
    }
  }

  /// Dispatch an event to all registered handlers
  Future<void> dispatch(DomainEvent event) async {
    // Add to stream for general listeners
    _eventStream.add(event);

    // Call specific handlers
    final handlers = _handlers[event.runtimeType] ?? [];
    final futures = handlers.map((handler) => handler(event));
    
    try {
      await Future.wait(futures);
    } catch (e) {
      // Log error but don't stop other handlers
      print('Error dispatching event ${event.eventType}: $e');
    }
  }

  /// Clear all handlers (useful for testing)
  void clear() {
    _handlers.clear();
  }

  /// Get count of handlers for a specific event type
  int getHandlerCount<T extends DomainEvent>() {
    return _handlers[T]?.length ?? 0;
  }

  /// Dispose resources
  void dispose() {
    _eventStream.close();
    _handlers.clear();
  }
}

/// Mixin to add event publishing capabilities to entities
mixin DomainEventPublisher {
  final List<DomainEvent> _domainEvents = [];

  /// Get all unpublished events
  List<DomainEvent> get domainEvents => List.unmodifiable(_domainEvents);

  /// Add an event to be published
  void addDomainEvent(DomainEvent event) {
    _domainEvents.add(event);
  }

  /// Clear all events (usually called after publishing)
  void clearDomainEvents() {
    _domainEvents.clear();
  }

  /// Publish all pending events
  Future<void> publishDomainEvents() async {
    final dispatcher = DomainEventDispatcher();
    for (final event in _domainEvents) {
      await dispatcher.dispatch(event);
    }
    clearDomainEvents();
  }
}
