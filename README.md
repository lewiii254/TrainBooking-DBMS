# Train Booking System - Database Management System (DBMS)

Welcome to the **Train Booking System** repository! This project features a well-structured relational database designed to manage train bookings effectively. The system is modeled to facilitate efficient management of passengers, trains, schedules, seats, payments, and stations.

---

## 🚀 Features

- **Passenger Management**: Store and manage passenger details including their name, email, and phone number.
- **Train Information**: Record details about trains, including their type and name.
- **Booking System**: Create, track, and manage bookings seamlessly.
- **Schedules**: Handle train departure, arrival times, and associated stations.
- **Seats Management**: Track seat availability, class type, and assignments.
- **Payment Processing**: Log payment transactions and statuses for bookings.
- **Station Details**: Store information about train stations and their locations.

---

## 🛠️ Database Design

The database is designed using **MySQL** and follows a relational model with primary and foreign keys for entity relationships. Below is an overview of the entities and their relationships.

### Entity-Relationship Diagram (ERD):

![ERD](Train%20Booking%20ERD.jpg)

### Key Entities:

1. **Passengers**:
   - `PassengerID` (Primary Key)
   - Name, Email, PhoneNumber

2. **Trains**:
   - `TrainID` (Primary Key)
   - TrainName, TrainType

3. **Bookings**:
   - `BookingID` (Primary Key)
   - BookingDate, BookingStatus, PassengerID (Foreign Key), TrainID (Foreign Key), ScheduleID (Foreign Key), SeatID (Foreign Key)

4. **Schedules**:
   - `ScheduleID` (Primary Key)
   - DepartureTime, ArrivalTime, Date, TrainID (Foreign Key), StationID (Foreign Key)

5. **Stations**:
   - `StationID` (Primary Key)
   - StationName, Location

6. **Seats**:
   - `SeatID` (Primary Key)
   - SeatNumber, ClassType, Availability, TrainID (Foreign Key)

7. **Payments**:
   - `PaymentID` (Primary Key)
   - BookingID (Foreign Key), Amount, PaymentDate, PaymentStatus

---

## 📂 Files in the Repository

1. **`booking.sql`**:
   - The SQL dump file containing the schema and sample data for the database.

2. **`Train Booking ERD.jpg`**:
   - A visual representation of the database's entity-relationship diagram.

---

## 🔧 Installation & Setup

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/lewiii254/TrainBooking-DBMS.git
   cd TrainBooking-DBMS
   ```

2. **Set Up MySQL Database**:
   - Open MySQL Workbench or your preferred SQL client.
   - Import the `booking.sql` file:
     ```sql
     source /path/to/booking.sql;
     ```

3. **Explore the Database**:
   - Run queries or integrate this database into your train booking system project.

---

## 📚 Usage Examples

Here are a few examples of how you can use the database:

1. **Add a New Passenger**:
   ```sql
   INSERT INTO Passengers (Name, Email, PhoneNumber)
   VALUES ('John Doe', 'john.doe@example.com', '1234567890');
   ```

2. **Check Available Seats for a Train**:
   ```sql
   SELECT * FROM Seats
   WHERE TrainID = 1 AND Availability = 'Available';
   ```

3. **Retrieve Train Schedule by Station**:
   ```sql
   SELECT * FROM Schedules
   WHERE StationID = 3;
   ```

---

## 🌟 Why This Project?

This database system provides:

- A solid foundation for building a scalable train booking system.
- A practical demonstration of relational database design and normalization.
- Flexibility to integrate with web or mobile applications for real-world use cases.

---

## 🤝 Contributing

We welcome contributions! If you'd like to improve the database design or add more features, feel free to:

1. Fork the repository.
2. Create a new branch.
3. Submit a pull request with your changes.

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).

---

## 💡 Acknowledgments

- MySQL Workbench for database design and management.
- The open-source community for fostering collaboration and learning.

---

## 📬 Contact

If you have any questions, suggestions, or feedback, feel free to reach out to:

**Marklewis Mutugi**  
*Software Engineer*  
[GitHub Profile](https://github.com/lewiii254)

---

