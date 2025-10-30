import httpClient from "./http-client";

interface LoginRequest {
  username: string;
  password: string;
}

interface TokenResponse {
  access_token: string;
  token_type: string;
  expires_in: number;
}

const authApi = {
  login(payload: LoginRequest) {
    return httpClient.post<TokenResponse>("/admin/auth/login", payload);
  },
};

export default authApi;
