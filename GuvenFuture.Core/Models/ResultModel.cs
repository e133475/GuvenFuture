namespace GuvenFuture.Core.Models
{
    public class ResultModel<T> : IResultModel<T>
    {
        public T? ResultData { get; set; }
        public bool IsSucces { get; set; }
        public string? Message { get; set; }
    }
}
