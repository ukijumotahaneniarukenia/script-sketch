import http from "../http-common";

class TutorialDataService {
    //クラス単位で作成すると複数のRESTのURLを一元管理できる
    //URLは外部のものに揃えるか、自前のREST鯖にするか
  getAll() {
    return http.get("/tutorials");
  }

  get(id: string) {
    return http.get(`/tutorials/${id}`);
  }

  create(data: any) {
    return http.post("/tutorials", data);
  }

  update(id: string, data: any) {
    return http.put(`/tutorials/${id}`, data);
  }

  delete(id: string) {
    return http.delete(`/tutorials/${id}`);
  }

  deleteAll() {
    return http.delete(`/tutorials`);
  }

  findByTitle(title: string) {
    return http.get(`/tutorials?title=${title}`);
  }
}

export default new TutorialDataService();