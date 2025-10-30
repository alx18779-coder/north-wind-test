import axios from "axios";

const httpClient = axios.create({
  baseURL: process.env.NEXT_PUBLIC_API_BASE_URL ?? "http://localhost:8000/api",
  timeout: 15000,
});

httpClient.interceptors.request.use((config) => {
  const token = typeof window !== "undefined" ? localStorage.getItem("nw_admin_token") : null;
  if (token) {
    config.headers = config.headers ?? {};
    config.headers.Authorization = `Bearer ${token}`;
  }
  return config;
});

export default httpClient;
