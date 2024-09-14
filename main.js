const express = require("express");

const app = express();

const PORT = process.env.PORT || 8000;

app.get("/", (req, res) => {
  return res.json({ message: "Hey , I am Docker" });
});

app.listen(PORT, () => console.log(`Docker node listening in port => ${PORT}`));
