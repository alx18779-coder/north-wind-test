import axios from "axios";

// 默认走同源代理 /api，避免在未设置环境变量时指向本机无效端口导致 CORS/网络错误
const httpClient = axios.create({
  baseURL: process.env.NEXT_PUBLIC_API_BASE_URL || "/api",
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
