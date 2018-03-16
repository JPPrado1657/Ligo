<?php
require_once("biblioteca.php");
if(!isset($_GET["id"])){
  die("No puedes acceder");
}
else{
  $pquant = 1;
  $data = getProductById($_GET["id"]);
  $name = $data[1];
  $info = $data[2];
  $amount = $data[5];
  $id = $_GET["id"];
  $quantity = $pquant;

}

class Paypal {
  var $apiUrl = "https://svcs.sandbox.paypal.com/AdaptivePayments/";
  var $paypalUrl = "https://sandbox.paypal.com/webscr?cmd=_ap-payment&paykey=";

  function __construct() {

      $this->headers = array(
          "X-PAYPAL-SECURITY-USERID: "."manuelgh98-facilitator_api1.hotmail.com",
          "X-PAYPAL-SECURITY-PASSWORD: "."UZUVUJMC8NS8UHZD",
          "X-PAYPAL-SECURITY-SIGNATURE: "."A5mHShpQ-4NWynyUUm2KG.MrHZzSAN6m5QjGOengslD2ykO6aai9OKsG",
          "X-PAYPAL-REQUEST-DATA-FORMAT: JSON",
          "X-PAYPAL-RESPONSE-DATA-FORMAT: JSON",
          "X-PAYPAL-APPLICATION-ID: APP-80W284485P519543T"


      );

  }
  function getPaymentOptions($paykey){

      $packet = array(
          "requestEnvelope" => array(
                "errorLanguage" => "en_US",
                "detailLevel" => "ReturnAll"
            ),
          "payKey" => $paykey
      );
      return $this->_paypalSend($packet, "GetPaymentOptions");

  }
  function setPaymentOptions(){

  }

  function _paypalSend($data,$call){

      $ch = curl_init();
      curl_setopt($ch, CURLOPT_URL, $this->apiUrl.$call);
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
      curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
      curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
      curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
      curl_setopt($ch, CURLOPT_HTTPHEADER, $this->headers);

      return json_decode(curl_exec($ch),TRUE);

  }
  function splitPay($amount,$name,$id,$quantity){

      //create payrequest
      $createPacket = array(
          "actionType" => "PAY",
          "currencyCode" => "MXN",
          "receiverList" => array(
              "receiver" => array(
                  array(
                      "amount" => $amount*$quantity,
                      "email" => "manuelgh98-buyer@hotmail.com"

                  )
              )
          ),
          "returnUrl" => "http://localhost/ligo_develop/WebPage/v2.0/index.php",
          "cancelUrl" => "http://localhost/ligo_develop/WebPage/v2.0/index.php",
          "requestEnvelope" => array(
              "errorLanguage" => "en_US",
              "detailLevel" => "ReturnAll"
          )
      );

      $response = $this->_paypalSend($createPacket, "Pay");
      $paykey = $response['payKey'];
      //var_dump($response);


      //SET PAYMENT DETAILS
      $detailsPacket = array(
        "requestEnvelope" => array(
            "errorLanguage" => "en_US",
            "detailLevel" => "ReturnAll"
        ),
          "payKey" => $paykey,
          "receiverOptions" => array(
                array(
                    "receiver" => array("email" => "manuelgh98-buyer@hotmail.com"),
                    "invoiceData" => array(
                        "item" => array(
                            array(
                                "name" => $name,
                                "price" => $amount,
                                "identifier" => $id
                            )
                        )
                    )
                )

          )
      );

      $response = $this->_paypalSend($detailsPacket, "SetPaymentOptions");
      //var_dump($response);
      $dets = $this->getPaymentOptions($paykey);
      //var_dump($dets);
      header("Location: ".$this->paypalUrl.$paykey);
  }




}

$paypal = new Paypal();
$paypal->splitPay($amount,$name,$id,$quantity);




 ?>
