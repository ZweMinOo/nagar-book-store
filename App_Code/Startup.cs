using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(nagarbookstore.Startup))]
namespace nagarbookstore
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
