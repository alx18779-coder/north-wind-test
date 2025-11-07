/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  // 统一使用带斜杠路径，避免 Next 将 /api/.../ 重定向到无斜杠，
  // 与后端 FastAPI(缺少斜杠→重定向到带斜杠)产生循环重定向。
  trailingSlash: true,
  async rewrites() {
    // 将浏览器对 /api 的请求代理到后端服务，避免在前端代码里写死主机/IP。
    // 在 Docker Compose 网络下，后端服务名为 "backend"，端口 10000。
    const target = process.env.NEXT_API_PROXY_TARGET || "http://backend:10000/api";
    return [
      {
        source: "/api/:path*",
        destination: `${target}/:path*`,
      },
    ];
  },
};

export default nextConfig;
