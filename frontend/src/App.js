import React, { useEffect, useState } from "react";
import api from "./api";

function App() {
  const [message, setMessage] = useState("");
  const [error, setError] = useState("");

  useEffect(() => {
    api.get("/")
      .then(res => setMessage(res.data))
      .catch(() => setError("Error connecting to backend"));
  }, []);

  return (
    <div>
      <h1>DevOps Practice Project</h1>
      {message && <p>{message}</p>}
      {error && <p style={{ color: "red" }}>{error}</p>}
    </div>
  );
}

export default App;
