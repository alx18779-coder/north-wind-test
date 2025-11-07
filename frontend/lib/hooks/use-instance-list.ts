"use client";

import { useQuery } from "@tanstack/react-query";

import httpClient from "../http-client";
import type { DatabaseInstance } from "../admin-api";

const fetchInstances = async (): Promise<DatabaseInstance[]> => {
  const response = await httpClient.get<DatabaseInstance[]>("/admin/db-instances");
  return response.data;
};

export default function useInstanceList() {
  return useQuery({ queryKey: ["instances"], queryFn: fetchInstances });
}
