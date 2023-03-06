const express = require("express");
const app = express();
const port = 3000;

const userRouter = require("./routes/userRoutes");
const signupRouter = require("./routes/signup");
const loginRouter = require('./routes/login');
const postRouter = require('./routes/postRoutes');

app.use(express.json());
app.use(
  express.urlencoded({
    extended: true,
  })
);

app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content, Accept, Content-Type, Authorization');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
  next();
});

app.get("/", (req, res) => {
  res.json({ message: "ok" });
});

app.use("/api/userRoutes", userRouter);
app.use("/api/auth/signup", signupRouter);
app.use("/api/auth/login",  loginRouter);
app.use('/api', postRouter);

app.use((err, req, res, next) => {
  const statusCode = err.statusCode || 500;
  console.error(err.message, err.stack);
  res.status(statusCode).json({ message: err.message });
  return;
});

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});
