using Kentico.Forms.Web.Mvc;
using Kentico.PageBuilder.Web.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShareableComponentBoilerplate
{
    public class ShareableComponentBoilerplateWidgetModel : IWidgetProperties
    {
        // Defines a property and sets its default value
        [EditingComponent(TextInputComponent.IDENTIFIER, Order = 0, Label = "Text")]
        public string TextValue { get; set; } = "Hello World";
    }
}
