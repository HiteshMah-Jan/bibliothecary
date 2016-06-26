require 'spec_helper'

describe Bibliothecary::Parsers::Nuget do
  it 'has a platform name' do
    expect(Bibliothecary::Parsers::Nuget::PLATFORM_NAME).to eq('nuget')
  end

  it 'parses dependencies from Project.json' do
    file = load_fixture('Project.json')

    expect(Bibliothecary::Parsers::Nuget.parse('Project.json', file)).to eq([
      {:name=>"Microsoft.AspNet.Server.Kestrel",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Server.IIS",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Mvc",
       :requirement=>"6.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Server.WebListener",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.StaticFiles",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"EntityFramework.InMemory",
       :requirement=>"7.0.0-beta7",
       :type=>"runtime"},
      {:name=>"EntityFramework.SqlServer",
       :requirement=>"7.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Authentication.Cookies",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Identity.EntityFramework",
       :requirement=>"3.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Framework.Configuration",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Framework.Configuration.EnvironmentVariables",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Framework.Configuration.Json",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"AutoMapper", :requirement=>"4.0.0-alpha1", :type=>"runtime"}
    ])
  end

  it 'parses dependencies from Project.lock.json' do
    file = load_fixture('Project.lock.json')

    expect(Bibliothecary::Parsers::Nuget.parse('Project.lock.json', file)).to eq([
      {:name=>"AutoMapper", :requirement=>"4.0.0-alpha1", :type=>"runtime"},
      {:name=>"EntityFramework.Core",
       :requirement=>"7.0.0-beta7",
       :type=>"runtime"},
      {:name=>"EntityFramework.InMemory",
       :requirement=>"7.0.0-beta7",
       :type=>"runtime"},
      {:name=>"EntityFramework.Relational",
       :requirement=>"7.0.0-beta7",
       :type=>"runtime"},
      {:name=>"EntityFramework.SqlServer",
       :requirement=>"7.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Ix-Async", :requirement=>"1.2.5", :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Antiforgery",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Authentication",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Authentication.Cookies",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Authorization",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Cors.Core",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Cryptography.Internal",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Cryptography.KeyDerivation",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.DataProtection",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.DataProtection.Abstractions",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Diagnostics.Abstractions",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.FileProviders.Abstractions",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.FileProviders.Physical",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Hosting",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Hosting.Abstractions",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Hosting.Server.Abstractions",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Html.Abstractions",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Http",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Http.Abstractions",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Http.Extensions",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Http.Features",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Identity",
       :requirement=>"3.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Identity.EntityFramework",
       :requirement=>"3.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.JsonPatch",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Loader.IIS",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Loader.IIS.Interop",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Localization",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Mvc",
       :requirement=>"6.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Mvc.Abstractions",
       :requirement=>"6.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Mvc.ApiExplorer",
       :requirement=>"6.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Mvc.Core",
       :requirement=>"6.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Mvc.Cors",
       :requirement=>"6.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Mvc.DataAnnotations",
       :requirement=>"6.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Mvc.Formatters.Json",
       :requirement=>"6.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Mvc.Localization",
       :requirement=>"6.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Mvc.Razor",
       :requirement=>"6.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Mvc.Razor.Host",
       :requirement=>"6.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Mvc.ViewFeatures",
       :requirement=>"6.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.PageExecutionInstrumentation.Interfaces",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Razor",
       :requirement=>"4.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Razor.Runtime",
       :requirement=>"4.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Routing",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Server.IIS",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Server.Kestrel",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.Server.WebListener",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.StaticFiles",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.AspNet.WebUtilities",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.CodeAnalysis.Analyzers",
       :requirement=>"1.1.0-beta1-20150812-01",
       :type=>"runtime"},
      {:name=>"Microsoft.CodeAnalysis.Common",
       :requirement=>"1.1.0-beta1-20150812-01",
       :type=>"runtime"},
      {:name=>"Microsoft.CodeAnalysis.CSharp",
       :requirement=>"1.1.0-beta1-20150812-01",
       :type=>"runtime"},
      {:name=>"Microsoft.CSharp",
       :requirement=>"4.0.1-beta-23225",
       :type=>"runtime"},
      {:name=>"Microsoft.Dnx.Compilation.Abstractions",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Dnx.Compilation.CSharp.Abstractions",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Dnx.Compilation.CSharp.Common",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Dnx.Runtime.Abstractions",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Framework.Caching.Abstractions",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Framework.Caching.Memory",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Framework.Configuration",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Framework.Configuration.Abstractions",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Framework.Configuration.Binder",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Framework.Configuration.CommandLine",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Framework.Configuration.EnvironmentVariables",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Framework.Configuration.Ini",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Framework.Configuration.Json",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Framework.DependencyInjection",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Framework.DependencyInjection.Abstractions",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Framework.Globalization.CultureInfoCache",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Framework.Localization",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Framework.Localization.Abstractions",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Framework.Logging",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Framework.Logging.Abstractions",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Framework.Notification",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Framework.OptionsModel",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Framework.WebEncoders",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Framework.WebEncoders.Core",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Net.Http.Headers",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Net.Http.Server",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Net.WebSockets",
       :requirement=>"1.0.0-beta7",
       :type=>"runtime"},
      {:name=>"Microsoft.Win32.Primitives",
       :requirement=>"4.0.1-beta-23225",
       :type=>"runtime"},
      {:name=>"Microsoft.Win32.Registry",
       :requirement=>"4.0.0-beta-23225",
       :type=>"runtime"},
      {:name=>"Newtonsoft.Json", :requirement=>"6.0.6", :type=>"runtime"},
      {:name=>"Remotion.Linq", :requirement=>"2.0.0-beta-002", :type=>"runtime"},
      {:name=>"System.Collections",
       :requirement=>"4.0.11-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Collections.Concurrent",
       :requirement=>"4.0.11-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Collections.Immutable",
       :requirement=>"1.1.36",
       :type=>"runtime"},
      {:name=>"System.Collections.NonGeneric",
       :requirement=>"4.0.0.0",
       :type=>"runtime"},
      {:name=>"System.Collections.Specialized",
       :requirement=>"4.0.0-beta-22816",
       :type=>"runtime"},
      {:name=>"System.ComponentModel",
       :requirement=>"4.0.1-beta-23225",
       :type=>"runtime"},
      {:name=>"System.ComponentModel.Annotations",
       :requirement=>"4.0.11-beta-23225",
       :type=>"runtime"},
      {:name=>"System.ComponentModel.EventBasedAsync",
       :requirement=>"4.0.10",
       :type=>"runtime"},
      {:name=>"System.ComponentModel.Primitives",
       :requirement=>"4.0.0",
       :type=>"runtime"},
      {:name=>"System.ComponentModel.TypeConverter",
       :requirement=>"4.0.1-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Console", :requirement=>"4.0.0-beta-23225", :type=>"runtime"},
      {:name=>"System.Data.Common",
       :requirement=>"4.0.1-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Data.SqlClient",
       :requirement=>"4.0.0-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Diagnostics.Contracts",
       :requirement=>"4.0.1-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Diagnostics.Debug",
       :requirement=>"4.0.11-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Diagnostics.Process",
       :requirement=>"4.0.0-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Diagnostics.Tools",
       :requirement=>"4.0.1-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Diagnostics.TraceSource",
       :requirement=>"4.0.0-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Diagnostics.Tracing",
       :requirement=>"4.0.21-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Dynamic.Runtime",
       :requirement=>"4.0.11-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Globalization",
       :requirement=>"4.0.11-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Globalization.Calendars",
       :requirement=>"4.0.0",
       :type=>"runtime"},
      {:name=>"System.Globalization.Extensions",
       :requirement=>"4.0.1-beta-23225",
       :type=>"runtime"},
      {:name=>"System.IO", :requirement=>"4.0.11-beta-23225", :type=>"runtime"},
      {:name=>"System.IO.FileSystem",
       :requirement=>"4.0.1-beta-23225",
       :type=>"runtime"},
      {:name=>"System.IO.FileSystem.Primitives",
       :requirement=>"4.0.1-beta-23225",
       :type=>"runtime"},
      {:name=>"System.IO.FileSystem.Watcher",
       :requirement=>"4.0.0-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Linq", :requirement=>"4.0.1-beta-23225", :type=>"runtime"},
      {:name=>"System.Linq.Expressions",
       :requirement=>"4.0.11-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Linq.Queryable",
       :requirement=>"4.0.1-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Net.NetworkInformation",
       :requirement=>"4.0.10-beta-23123",
       :type=>"runtime"},
      {:name=>"System.Net.Primitives",
       :requirement=>"4.0.11-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Net.Security",
       :requirement=>"4.0.0-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Net.Sockets",
       :requirement=>"4.1.0-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Net.WebSockets",
       :requirement=>"4.0.0-beta-23225",
       :type=>"runtime"},
      {:name=>"System.ObjectModel",
       :requirement=>"4.0.11-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Private.Networking",
       :requirement=>"4.0.1-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Private.Uri",
       :requirement=>"4.0.1-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Reflection",
       :requirement=>"4.1.0-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Reflection.Emit",
       :requirement=>"4.0.1-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Reflection.Emit.ILGeneration",
       :requirement=>"4.0.0",
       :type=>"runtime"},
      {:name=>"System.Reflection.Emit.Lightweight",
       :requirement=>"4.0.1-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Reflection.Extensions",
       :requirement=>"4.0.1-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Reflection.Metadata",
       :requirement=>"1.1.0-alpha-00009",
       :type=>"runtime"},
      {:name=>"System.Reflection.Primitives",
       :requirement=>"4.0.0",
       :type=>"runtime"},
      {:name=>"System.Reflection.TypeExtensions",
       :requirement=>"4.0.1-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Resources.ReaderWriter",
       :requirement=>"4.0.0-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Resources.ResourceManager",
       :requirement=>"4.0.1-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Runtime",
       :requirement=>"4.0.21-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Runtime.Extensions",
       :requirement=>"4.0.11-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Runtime.Handles",
       :requirement=>"4.0.1-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Runtime.InteropServices",
       :requirement=>"4.0.21-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Runtime.Numerics", :requirement=>"4.0.0", :type=>"runtime"},
      {:name=>"System.Security.Claims",
       :requirement=>"4.0.1-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Security.Cryptography.Algorithms",
       :requirement=>"4.0.0-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Security.Cryptography.Csp",
       :requirement=>"4.0.0-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Security.Cryptography.Encoding",
       :requirement=>"4.0.0-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Security.Cryptography.Primitives",
       :requirement=>"4.0.0-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Security.Cryptography.X509Certificates",
       :requirement=>"4.0.0-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Security.Principal",
       :requirement=>"4.0.1-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Security.Principal.Windows",
       :requirement=>"4.0.0-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Security.SecureString",
       :requirement=>"4.0.0-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Text.Encoding",
       :requirement=>"4.0.11-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Text.Encoding.CodePages",
       :requirement=>"4.0.1-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Text.Encoding.Extensions",
       :requirement=>"4.0.11-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Text.RegularExpressions",
       :requirement=>"4.0.11-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Threading",
       :requirement=>"4.0.11-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Threading.Overlapped",
       :requirement=>"4.0.1-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Threading.Tasks",
       :requirement=>"4.0.11-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Threading.Tasks.Parallel",
       :requirement=>"4.0.1-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Threading.Thread",
       :requirement=>"4.0.0-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Threading.ThreadPool",
       :requirement=>"4.0.10-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Threading.Timer",
       :requirement=>"4.0.1-beta-23225",
       :type=>"runtime"},
      {:name=>"System.Xml.ReaderWriter", :requirement=>"4.0.10", :type=>"runtime"},
      {:name=>"System.Xml.XDocument",
       :requirement=>"4.0.11-beta-23225",
       :type=>"runtime"}
    ])
  end

  it 'parses dependencies from packages.config' do
    file = load_fixture('packages.config')

    expect(Bibliothecary::Parsers::Nuget.parse('packages.config', file)).to eq([
      {:name=>"AutoMapper", :version=>"2.1.267", :type=>"runtime"},
      {:name=>"Microsoft.Web.Infrastructure",
       :version=>"1.0.0.0",
       :type=>"runtime"},
      {:name=>"Mvc3Futures", :version=>"3.0.20105.0", :type=>"runtime"},
      {:name=>"Ninject", :version=>"3.0.1.10", :type=>"runtime"},
      {:name=>"Ninject.Web.Common", :version=>"3.0.0.7", :type=>"runtime"},
      {:name=>"WebActivator", :version=>"1.5", :type=>"runtime"}
    ])
  end

  it 'parses dependencies from example.nuspec' do
    file = load_fixture('example.nuspec')

    expect(Bibliothecary::Parsers::Nuget.parse('example.nuspec', file)).to eq([
      {:name=>"FubuCore", :version=>"3.2.0.3001", :type=>"runtime"},
      {:name=>"HtmlTags", :version=>"[3.2.0.3001]", :type=>"runtime"},
      {:name=>"DotNetZip", :version=>"*", :type=>"runtime"}
    ])
  end
end
