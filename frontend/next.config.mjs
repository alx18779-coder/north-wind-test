/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
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
