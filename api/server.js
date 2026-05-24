import app from "./app.js";
import config from "./config/index.js";

app.listen(config.port, () => {
  console.log(`Start:: Server running on port ${config.port}`);
});
