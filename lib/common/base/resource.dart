class Resource<T>{
  T data;
  Status state;
  Exception exception;

  Resource.success(this.data){
    state = Status.SUCCESS;
  }

  Resource.loading(){
    state = Status.LOADING;
  }

  Resource.error(this.exception){
    state = Status.ERROR;

  }
}

enum Status{
  SUCCESS,LOADING,ERROR
}