import httpClient from "./http-client";

export interface DatabaseInstance {
  id: number;
  name: string;
  engine: string;
  host: string;
  port: number;
  database: string;
  username: string;
  timeout_seconds: number;
  max_rows: number;
  max_concurrency: number;
  rate_limit_per_minute: number;
  status: string;
  tags: string[];
  notes?: string | null;
}

export interface InstanceCreateRequest {
  name: string;
  engine: string;
  host: string;
  port: number;
  database: string;
  username: string;
  password: string;
  timeout_seconds: number;
  max_rows: number;
  max_concurrency: number;
  rate_limit_per_minute: number;
  tags: string[];
  notes?: string | null;
}

export interface InstanceUpdateRequest extends Partial<Omit<InstanceCreateRequest, "password" | "tags">> {
  password?: string;
  tags?: string[];
  status?: string;
}

export interface DbInitJob {
  id: number;
  instance_id: number;
  status: string;
  created_at: string;
  completed_at?: string | null;
  log?: string | null;
}

export interface QuestionSummary {
  id: number;
  question_id: string;
  title: string;
  difficulty: string;
  category: string;
  status: string;
}

export interface QuestionReference {
  id: number;
  engine: string;
  sql_text: string;
}

export interface QuestionHint {
  id: number;
  display_order: number;
  content: string;
}

export interface QuestionDetail extends QuestionSummary {
  description: string;
  required_fields: string;
  instance_tags: string[];
  notes?: string | null;
  reference_sql: QuestionReference[];
  hints: QuestionHint[];
}

export interface QuestionCreateRequest {
  question_id: string;
  title: string;
  description: string;
  required_fields: string;
  difficulty: string;
  category: string;
  status: string;
  instance_tags: string[];
  notes?: string | null;
  reference_sql: Array<{ engine: string; sql_text: string }>;
  hints: Array<{ display_order: number; content: string }>;
}

export type QuestionUpdateRequest = Partial<QuestionCreateRequest>;

export interface ExecutionLogItem {
  id: number;
  instance_tag: string;
  status: string;
  created_at: string;
  question_id?: number | null;
  execution_time_ms?: number | null;
}

export interface AuditLogItem {
  id: number;
  action: string;
  success: boolean;
  created_at: string;
  target_type?: string | null;
  target_id?: string | null;
}

export interface AdminChangePasswordRequest {
  username: string;
  current_password: string;
  new_password: string;
}

const adminApi = {
  listInstances() {
    return httpClient.get<DatabaseInstance[]>("/admin/db-instances/");
  },
  getInstance(id: number) {
    return httpClient.get<DatabaseInstance>(`/admin/db-instances/${id}`);
  },
  createInstance(payload: InstanceCreateRequest) {
    return httpClient.post<DatabaseInstance>("/admin/db-instances/", payload);
  },
  updateInstance(id: number, payload: InstanceUpdateRequest) {
    return httpClient.patch<DatabaseInstance>(`/admin/db-instances/${id}`, payload);
  },
  deleteInstance(id: number) {
    return httpClient.delete(`/admin/db-instances/${id}`);
  },
  testInstance(id: number) {
    return httpClient.post(`/admin/db-instances/${id}/test`);
  },
  initInstance(id: number) {
    return httpClient.post<DbInitJob>(`/admin/db-instances/${id}/init`);
  },
  decryptPassword(id: number) {
    return httpClient.post<string>(`/admin/db-instances/${id}/decrypt-password`);
  },
  listInitJobs(id: number) {
    return httpClient.get<DbInitJob[]>(`/admin/db-instances/${id}/init-jobs`);
  },
  listQuestions() {
    return httpClient.get<QuestionSummary[]>("/admin/questions/");
  },
  getQuestion(id: number) {
    return httpClient.get<QuestionDetail>(`/admin/questions/${id}`);
  },
  createQuestion(payload: QuestionCreateRequest) {
    return httpClient.post<QuestionDetail>("/admin/questions/", payload);
  },
  updateQuestion(id: number, payload: QuestionUpdateRequest) {
    return httpClient.patch<QuestionDetail>(`/admin/questions/${id}`, payload);
  },
  deleteQuestion(id: number) {
    return httpClient.delete(`/admin/questions/${id}`);
  },
  exportQuestions() {
    return httpClient.get<QuestionDetail[]>("/admin/questions/export");
  },
  importQuestions(payload: QuestionCreateRequest[]) {
    return httpClient.post("/admin/questions/import", payload);
  },
  validateQuestions(payload: QuestionCreateRequest[]) {
    return httpClient.post<{ ok: boolean; errors: Array<{ index: number; field: string; message: string }>; stats: { rows: number; valid: number; invalid: number } }>(
      "/admin/questions/import/validate",
      payload
    );
  },
  listExecutionLogs() {
    return httpClient.get<ExecutionLogItem[]>("/admin/logs/execution");
  },
  listAuditLogs() {
    return httpClient.get<AuditLogItem[]>("/admin/logs/audit");
  },
  changePassword(payload: AdminChangePasswordRequest) {
    return httpClient.post<void>("/admin/auth/change-password", payload);
  },
};

export default adminApi;
