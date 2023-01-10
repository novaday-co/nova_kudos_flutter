class PaginationResourceModel<T> {
  List<T> data = [];
  MetaModel? meta;

  PaginationResourceModel({
    this.data = const [],
    this.meta,
  });
}

class MetaModel {
  MetaModel({required this.lastPage, required this.currentPage});

  int currentPage;
  int lastPage;

  bool isLastPage() => currentPage == lastPage;
}
