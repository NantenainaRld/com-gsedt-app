export const errorHandler = (err, req, res, next) => {
  console.log("Error message::", err.message);
  console.log("Error stack::", err.stack);

  // generic error
  if (err.statusCode) {
    return res.status(err.statusCode).json({
      success: false,
      message: err.message,
    });
  }

  // error JWT
  if (err.name === "TokenExpiredError") {
    return res.status(401).json({
      success: false,
      message: "Session expirée, reconnectez-vous",
    });
  }
  if (err.name === "JsonWebTokenError") {
    return res.status(401).json({
      success: false,
      message: "Token invalide",
    });
  }

  // default error
  res.status(500).json({
    success: false,
    message: "Erreur interne serveur",
  });
};
