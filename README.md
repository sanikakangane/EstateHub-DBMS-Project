# EstateHub — Real Estate Property Listing & Enquiry Management System

EstateHub is a PostgreSQL-based DBMS project designed to manage real estate property listings, owners, agents, locations, buyers, and property enquiries in a structured relational database.

The project demonstrates how a real-world property management system can be designed using relational database concepts, table relationships, SQL queries, aggregation, filtering, and database views.

## Project Overview

EstateHub provides a centralized database for managing property-related information and buyer enquiries.

The system supports:

- Managing property listings and availability status
- Maintaining owner and agent information
- Storing property location details
- Managing buyer information
- Tracking buyer enquiries and follow-ups
- Filtering properties by city, price range, and availability
- Generating property statistics
- Retrieving related information using SQL joins
- Creating a consolidated view of available properties

## Database Structure

The database consists of six main tables:

| Table | Description |
|---|---|
| `agent` | Stores real estate agent details |
| `buyer` | Stores buyer information |
| `owner` | Stores property owner details |
| `location` | Stores city and pincode information |
| `property` | Stores property details, pricing, status, and relationships |
| `buyerpropertyenquiry` | Stores buyer enquiries and follow-up information |

## Entity Relationships

- One owner can have multiple properties.
- One agent can manage multiple properties.
- One location can contain multiple properties.
- One buyer can make multiple enquiries.
- One property can receive multiple enquiries.

Primary keys and foreign keys are used to establish relationships and maintain referential integrity between related tables.

## Key Features

### Property Management

Stores property type, price, availability status, owner, location, and assigned agent.

### Buyer Enquiry Tracking

Records buyer enquiries along with enquiry dates, messages, follow-up status, and follow-up dates.

### Property Filtering

Properties can be filtered based on:

- Availability status
- City
- Price range

### Property Statistics

The database generates useful statistics including:

- Total number of properties
- Average property price
- Properties by city
- Properties by status
- Properties managed by each agent

### AvailableListings View

The project includes an `AvailableListings` view that combines information from the `property`, `owner`, `location`, and `agent` tables.

It provides a consolidated listing of currently available properties along with owner, location, and agent contact details.

## SQL Concepts Demonstrated

The project demonstrates the following PostgreSQL and SQL concepts:

- Database creation
- Table creation
- Primary keys
- Foreign keys
- Data insertion
- `SELECT`
- `WHERE`
- `JOIN`
- `LEFT JOIN`
- `BETWEEN`
- `ORDER BY`
- `COUNT()`
- `AVG()`
- `GROUP BY`
- `HAVING`
- `CREATE VIEW`

## Queries Implemented

The project includes queries for:

1. Viewing available properties
2. Finding available properties in Mumbai
3. Finding Mumbai properties within a specified price range
4. Calculating the total number of properties
5. Calculating the average property price
6. Displaying property and owner details
7. Displaying property and agent details
8. Tracking buyer enquiries
9. Grouping properties by city
10. Grouping properties by status
11. Grouping properties by agent
12. Creating and displaying the `AvailableListings` view
13. Finding cities with more than one property

## Technology Used

- PostgreSQL
- SQL
- pgAdmin / PostgreSQL Terminal

## Project File

`EstateHub.sql`

The SQL file contains the complete database creation, table definitions, sample data, queries, and the `AvailableListings` view required for the project.

## How to Run

1. Open PostgreSQL using pgAdmin or the PostgreSQL terminal.
2. Run the database creation command.
3. Connect to the `estatehub_db` database.
4. Execute the remaining SQL statements from `EstateHub.sql`.
5. Run the queries to verify the stored data and generated results.

## Project Type

DBMS Case Study  
Real Estate Property Listing & Enquiry Management System

## Author

Sanika Kangane
