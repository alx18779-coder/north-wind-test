import httpClient from "./http-client";

export interface PracticeQuestionSummary {
  id: number;
  question_id: string;
  title: string;
  difficulty: string;
  category: string;
  instance_tags: string[];
}

export interface PracticeQuestionDetail extends PracticeQuestionSummary {
  description: string;
  required_fields: string;
  hints: string[];
  notes?: string | null;
}

export interface ExecuteQuestionPayload {
  questionId: number;
  sql: string;
  instanceTag: string;
}

export interface ExecuteQuestionResult {
  columns: string[];
  rows: Array<Record<string, unknown>>;
  truncated: boolean;
  execution_time_ms: number;
}

const practiceApi = {
  listQuestions() {
    return httpClient.get<PracticeQuestionSummary[]>("/practice/questions");
  },
  getQuestion(id: number) {
    return httpClient.get<PracticeQuestionDetail>(`/practice/questions/${id}`);
  },
  executeQuestion(payload: ExecuteQuestionPayload) {
    return httpClient.post<{ data: ExecuteQuestionResult }>(
      `/practice/questions/${payload.questionId}/execute`,
      {
        sql: payload.sql,
        instance_tag: payload.instanceTag,
      }
    );
  },
  getReference(questionId: number, instanceTag: string) {
    return httpClient.get<{ sql: string }>(`/practice/questions/${questionId}/reference`, {
      params: { instance_tag: instanceTag },
    });
  },
};

export default practiceApi;
