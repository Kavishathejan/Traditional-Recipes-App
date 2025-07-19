# 🥗 Asian Traditional Recipe Book App

A mobile application built with Flutter that displays traditional Asian recipes by category. The app is connected to a Node.js backend with MongoDB for storing and retrieving recipe data.

## 📱 Features

- View categorized recipes (e.g., Currys, Rices, Cakes)
- Search recipes by keyword
- View detailed recipe info with image, title, and description
- Responsive and beautiful UI
- Bottom navigation bar for easy navigation

## 🚀 Tech Stack

### Frontend (Flutter)
- Flutter 3.24.5
- MVVM architecture
- REST API integration
- State management using `setState`

### Backend (Node.js + MongoDB)
- Express.js server
- MongoDB database
- RESTful API for recipe data

## 📂 Project Structure

project/
├── backend/ # Node.js + MongoDB backend
├── lib/
│ ├── main.dart
│ ├── main_scaffold.dart
│ ├── models/recipe.dart
│ ├── services/api_service.dart
│ └── screens/
│ ├── category_screen.dart
│ ├── recipe_list_screen.dart
│ ├── recipe_detail_screen.dart
│ └── search_screen.dart


## 🛠️ Setup Instructions

### ✅ Prerequisites

- Flutter SDK
- Node.js & npm
- MongoDB (local or Atlas)

---

### 📦 Backend Setup

```bash
cd backend
npm install
# Add your MongoDB URI to .env
node index.js


## 🛠️ Setup Instructions

### ✅ Prerequisites

- Flutter SDK
- Node.js & npm
- MongoDB (local or Atlas)

---

### 📦 Backend Setup

```bash
cd backend
npm install
# Add your MongoDB URI to .env
node server.js
