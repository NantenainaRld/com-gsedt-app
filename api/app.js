import express from "express";

const app = express();

// Middlewares
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// TODO: Add routes

// TODO: Add error handler

export default app;
