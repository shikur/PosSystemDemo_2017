using System.Data;

namespace Pos.Repository
{
    public interface IConnectionFactory
    {
        IDbConnection Create();
    }
}