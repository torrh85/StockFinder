# Technical Challenge
Stocks Finder

# Requirements

Implement a search bar where users can search for stocks by ticker or company name

1. Display a list of matching stocks with name, ticker, and current price
2. Implement real-time search as the user types
3. Show a loading indicator while fetching results
4. Handle cases where no results are found
 
# Setup instructions

To get started, clone this repository and launch the application. The app features a search view component where you can type to search for a specific stock. If cached stocks are available, they will be displayed immediately when the app starts. Otherwise, the search view will present a list of results as you type.

# Overview solution

For the design and architecture of the project, I chose the MVVM (Model-View-ViewModel) pattern as it best aligns with the project requirements. MVVM enables a clear separation of concerns by decoupling business logic from the view layer, while also allowing the view to react seamlessly to changes in the view models.

The MVVM architecture consists of three layers:

Model Layer: Represents the data and business logic of the application.
ViewModel Layer: Handles presentation logic and bridges the communication between the model and the view.
View Layer: Displays UI elements and reacts to changes in the ViewModel.
As a result, the view layer and the model layer are completely decoupled, ensuring that the view only communicates with the ViewModel. This approach improves testability, maintainability, and flexibility.

In addition, to meet the technical requirements, the Repository Pattern was implemented to manage data access. The repository acts as a single source of truth, abstracting data access from multiple sources, such as:

Server: Remote data fetched through networking.
Disk or Memory: Local persistence or in-memory caching.

The repository provides a clean interface for data retrieval, simplifying networking and persistence operations.

# Any assumptions or simplifications made while implementing

1. Include cached stocks on the screen when the app launches.
2. The cache implementation does not include any expiration mechanism, but this can be considered for future improvements

| Initial Screen  | Error handling | Results not found |
| ------------- | ------------- | ------------- |
|![Simulator Screenshot - iPhone 15 Pro - 2024-12-16 at 20 19 27](https://github.com/user-attachments/assets/1331b0ca-2dd4-43f4-80c8-6314ac8d1704)|![Simulator Screenshot - iPhone 15 Pro - 2024-12-16 at 18 13 07](https://github.com/user-attachments/assets/e720c05a-b990-4a98-83fa-5201f7630b3e)|![Simulator Screenshot - iPhone 15 Pro - 2024-12-16 at 21 01 16](https://github.com/user-attachments/assets/62badce6-930d-4ffb-9b03-6b8906b5b88a)|




