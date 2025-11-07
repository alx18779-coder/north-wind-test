"use client";

import { useQuery } from "@tanstack/react-query";

import httpClient from "../http-client";

interface DatabaseInstance {
  id: number;
  name: string;
  engine: string;
  host: string;
  port: number;
  timeout_seconds: number;
}

const fetchInstances = async (): Promise<DatabaseInstance[]> => {
  const response = await httpClient.get<DatabaseInstance[]>("/admin/db-instances");
  return response.data;
};

export default function useInstanceList() {
  return useQuery({ queryKey: ["instances"], queryFn: fetchInstances });
}
