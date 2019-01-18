using System;
using System;
using System.Web.Script.Services;
using Twilio;
using Twilio.Rest.Api.V2010.Account;

namespace TwilioApp
{
    public partial class index : System.Web.UI.Page
    {
        protected void btnOrder_Click(object sender, EventArgs e)
        {

            
        }
   
        [System.Web.Services.WebMethod(true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public static string GetUserOrder(string menu, string orderName, string orderRef)
        {

            String data = "*NEW ORDER FROM TWILIO API*" + 
                Environment.NewLine +
                Environment.NewLine +
                "*Order Name*: ```" + orderName +"```"+
                Environment.NewLine +
                "*Ingridients*: ```" + menu +"```"+
                Environment.NewLine +
                Environment.NewLine +
                "*Order Reference*: ```" + orderRef + "```" +
                Environment.NewLine + 
                "*Order Time*: " + DateTime.Now.ToString();

            // Find your Account Sid and Token at twilio.com/console
            const string accountSid = "AC685df8af42aa8ef2ba4d004a00ac93df";
            const string authToken = "a1e0fcf6409b6f4a03b582cb05cdeeb6";
            TwilioClient.Init(accountSid, authToken);

            var message = MessageResource.Create(
                    body: data,
                    from: new Twilio.Types.PhoneNumber("whatsapp:+14155238886"),
                    to: new Twilio.Types.PhoneNumber("whatsapp:+27617262421")
                );

            Console.WriteLine(message.Body);

            //return order;
            return data;
        }
    }
}