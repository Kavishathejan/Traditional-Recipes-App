const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const bodyParser = require("body-parser");

const app = express();
app.use(cors());
app.use(bodyParser.json());

// Connect to MongoDB Atlas
mongoose.connect("mongodb+srv://<username>:<password>@cluster.mongodb.net/mydatabase")
  .then(() => console.log("✅ Connected to MongoDB"))
  .catch((err) => console.error("❌ MongoDB connection error:", err));

// Schema
const RecipeSchema = new mongoose.Schema({
  title: String,
  description: String,
  category: String,
  image: String,
  ingredients: [String],
  steps: [String],
});

const Recipe = mongoose.model("Recipe", RecipeSchema);

// Routes
app.get('/recipes', async (req, res) => {
  const category = req.query.category;
  const query = category ? { category } : {};
  const recipes = await Recipe.find(query);
  res.json(recipes);
});


app.post("/recipes", async (req, res) => {
  try {
    const recipe = new Recipe(req.body);
    await recipe.save();
    res.status(201).json(recipe);
  } catch (err) {
    console.error("❌ Error adding recipe:", err);
    res.status(500).json({ error: "Failed to add recipe" });
  }
});

app.listen(3000, "0.0.0.0", () => {
  console.log("🚀 Server running at http://0.0.0.0:3000");
});
