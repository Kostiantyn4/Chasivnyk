# Chasivnyk
The app is an offline planner that allows creating projects composed of tasks and subtasks. Users can assign deadlines with options for daily, weekly, monthly, or yearly schedules. The app supports progress tracking, task repetition, tagging, reminders, and a timeline view combining tasks across different periods.

## Project structure:
/lib
  /core
    /constants      # Constants (colors, sizes, keys)
    /errors         # Error handling
    /utils          # Utilities
    /extensions     # Extensions
    /theme          # Themes
    /di             # Dependency injection
    /config         # Configurations
    /navigation     # Navigation

  /data
    /models         # Data models
    /datasources    # Local storage
    /repositories   # Repositories
    /dto            # Data Transfer Objects
    /mappers        # Data conversion

  /domain
    /entities       # Business models
    /usecases       # Business logic

  /presentation
    /providers      # State management
    /screens        # Screens
    /widgets        # UI components
    /common         # Common UI elements
    /navigation     # Navigation components
    /viewmodels     # UI logic

  /generated        # Generated code
  /l10n             # Localization

/assets
  /images
  /fonts

/test              # Тести