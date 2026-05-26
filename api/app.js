import express from "express";
import { errorHandler } from "./modules/middlewares/errorHandler.js";

const app = express();

// Middlewares
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// TODO: Add routes

// Error handler
app.use(errorHandler);

export default app;
