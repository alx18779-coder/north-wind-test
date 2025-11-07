/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  // 保持 Next.js 默认的“去掉结尾斜杠”行为，
  // 前端请求一律使用无斜杠路径，避免与后端产生相反方向的重定向。
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
