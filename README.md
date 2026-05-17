# 🧁 Bakery Order and Custom Cake Booking Platform

A Java web-based Object Oriented Programming project developed for the **SE1020 - Object Oriented Programming** module.

This system allows a bakery to manage customers, bakery items, orders, custom cake bookings, payments, and reviews using **Java, JSP, Servlets, Maven, and File Handling**.

---

## 📌 Project Title

**Bakery Order and Custom Cake Booking Platform**

---

## 👨‍💻 Team Members & Workload Distribution

| No | Student Name | Student ID | Branch | Assigned Module |
|---|---|---|---|---|
| 1 | Rohana P H A S | IT25102963 | `feature/customer-management` | 👤 Customer Management |
| 2 | Yaksika P | IT25103949 | `feature/item-management` | 🍰 Bakery Item Management |
| 3 | Tharumina W A | IT25101613 | `feature/order-management` | 🛒 Order Management |
| 4 | Mahanama M N S T | IT25100228 | `feature/custom-cake-booking` | 🎂 Custom Cake Booking |
| 5 | Nimsara K A L D | IT25102450 | `feature/payment-management` | 💳 Payment Management |
| 6 | Gunasekara N D G P S | IT25101106 | `feature/review-management` | ⭐ Feedback & Review Management |

---

## 🚀 Main Features

### 👤 Customer Management
- Add new customers
- View customer details
- Update customer information
- Delete customer records

### 🍰 Bakery Item Management
- Add bakery items
- View available items
- Update item price and quantity
- Delete bakery items

### 🛒 Order Management
- Place bakery orders
- View order details
- Update order status
- Cancel orders

### 🎂 Custom Cake Booking
- Create custom cake bookings
- View booking details
- Update cake design or delivery date
- Cancel bookings

### 💳 Payment Management
- Add payment records
- View payment details
- Update payment status
- Delete/refund payment records

### ⭐ Feedback & Review Management
- Add customer reviews
- View reviews
- Update review details
- Delete reviews

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Java | Backend development |
| JSP | Web pages |
| Servlets | Request handling |
| HTML | Page structure |
| CSS | Styling |
| JavaScript | UI enhancements |
| Maven | Project management |
| File Handling | Data storage |
| Git & GitHub | Version control |
| IntelliJ IDEA | IDE |
| Apache Tomcat | Web server |

---

## 📁 Project Structure

```text
BakeryOrderSystem
│
├── src
│   └── main
│       ├── java
│       │   └── com
│       │       └── bakery
│       │           ├── model
│       │           ├── service
│       │           ├── servlet
│       │           └── util
│       │
│       └── webapp
│           ├── index.jsp
│           ├── customers.jsp
│           ├── items.jsp
│           ├── orders.jsp
│           ├── bookings.jsp
│           ├── payments.jsp
│           ├── reviews.jsp
│           └── WEB-INF
│               └── web.xml
│
├── data
│   ├── customers.txt
│   ├── items.txt
│   ├── orders.txt
│   ├── bookings.txt
│   ├── payments.txt
│   └── reviews.txt
│
├── pom.xml
└── README.md
```

---

## 🧠 OOP Concepts Used

### 🔒 Encapsulation

Private class attributes with public getters and setters.

Example:

```java
private String customerName;

public String getCustomerName() {
    return customerName;
}
```

### 🧬 Inheritance

Child classes inherit from parent classes.

Example:

```java
public class Cake extends BakeryItem {
}
```

### 🔁 Polymorphism

Overridden methods behave differently depending on object type.

Example:

```java
@Override
public String displayItemType() {
    return "Cake Item";
}
```

### 🎭 Abstraction

Service classes hide file handling and business logic from JSP pages.

Example:

```java
CustomerService
ItemService
OrderService
```

### 🗂️ File Handling

All data is stored using `.txt` files instead of a database.

Example:

```text
customers.txt
items.txt
orders.txt
bookings.txt
payments.txt
reviews.txt
```

---

## 🌿 Git Branches

Each member has a separate Git branch for their assigned module.

```bash
feature/customer-management
feature/item-management
feature/order-management
feature/custom-cake-booking
feature/payment-management
feature/review-management
```

---

## ⚙️ How to Build and Run the Project

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/YOUR_USERNAME/BakeryOrderSystem.git
```

### 2️⃣ Open Project in IntelliJ IDEA

Open IntelliJ IDEA and select:

```text
File → Open → BakeryOrderSystem
```

### 3️⃣ Load Maven Dependencies

Open `pom.xml`, then click:

```text
Load Maven Changes
```

### 4️⃣ Configure Apache Tomcat

Go to:

```text
Run → Edit Configurations → Add New Configuration → Tomcat Server → Local
```

Add artifact:

```text
BakeryOrderSystem:war exploded
```

### 5️⃣ Run the Project

Click the green **Run** button.

Open browser:

```text
http://localhost:8080/BakeryOrderSystem/
```

---

## 📦 Data Storage

This project uses file handling for data storage.

| File            | Stores                      |
| --------------- | --------------------------- |
| `customers.txt` | Customer details            |
| `items.txt`     | Bakery item details         |
| `orders.txt`    | Order details               |
| `bookings.txt`  | Custom cake booking details |
| `payments.txt`  | Payment details             |
| `reviews.txt`   | Feedback and review details |

---

## 🧪 Sample Data Format

### customers.txt

```text
C001,Akash,akash@email.com,0771234567
```

### items.txt

```text
I001,Chocolate Cake,Cake,3500.00,10
```

### orders.txt

```text
O001,C001,I001,2,Pending
```

### bookings.txt

```text
B001,C001,Birthday Cake,Chocolate,2026-05-20,Pending
```

### payments.txt

```text
P001,O001,7000.00,Card,Paid
```

### reviews.txt

```text
R001,C001,I001,5,Excellent cake!
```

---

## 📊 CRUD Operations

| Module                 | Create | Read | Update | Delete |
| ---------------------- | ------ | ---- | ------ | ------ |
| Customer Management    | ✅      | ✅    | ✅      | ✅      |
| Bakery Item Management | ✅      | ✅    | ✅      | ✅      |
| Order Management       | ✅      | ✅    | ✅      | ✅      |
| Custom Cake Booking    | ✅      | ✅    | ✅      | ✅      |
| Payment Management     | ✅      | ✅    | ✅      | ✅      |
| Review Management      | ✅      | ✅    | ✅      | ✅      |

---

## 📚 Project Requirements Covered

* ✅ Java web application
* ✅ JSP and Servlets
* ✅ File read/write operations
* ✅ Minimum 3 CRUD operations
* ✅ Object Oriented Programming concepts
* ✅ User-friendly interface
* ✅ GitHub version control
* ✅ Individual branch contribution
* ✅ Class diagrams and documentation support

---

## 🏁 Final Note

This project was developed as a group assignment for the **SE1020 Object Oriented Programming** module.
Each member contributed to a separate module using individual Git branches to clearly show contribution history.

```
```
