namespace GuvenFuture.Core.Models
{
    public interface IResultModel<T>
    {
        T? ResultData { get; set; }
        bool IsSucces { get; set; }
        string? Message { get; set; }
    }
}
