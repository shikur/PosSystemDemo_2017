namespace Pos.Repository
{
    public interface IUnitOfWork
    {
        void Dispose();
        void SaveChanges();
    }
}