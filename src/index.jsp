<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #006699;
        }
        form {
            border: 1px solid #ccc;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 2px 2px #ccc;
        }
        label {
            display: inline-block;
            width: 100px;
            text-align: right;
            margin-right: 20px;
        }
        input[type="text"] {
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        select {
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        input[type="button"] {
            background-color: #006699;
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        #result {
            margin-top: 20px;
            font-size: 18px;
            color: #006699;
            font-weight: bold;
        }
        #madeby{
            bottom: 0%;
            margin-top: 35vh;
        }
        #form-in{
            margin-left: 40%;
        }
    </style>
    <meta charset="UTF-8">
    <title>Currency Converter</title>
</head>
<body>
    <h1>Currency Converter</h1>
    <form>
        <div id="form-in">
            <label for="amount">Amount:</label>
            <input type="text" id="amount" name="amount" value="1"><br><br>
            <label for="fromCurrency">From:</label>
            <select id="fromCurrency" name="fromCurrency">
                <option value="EUR">EUR</option>
                <option value="INR">INR</option>
                <option value="USD">USD</option>
                <option value="JPY">JPY</option>
            </select><br><br>
            <label for="toCurrency">To:</label>
            <select id="toCurrency" name="toCurrency">
                <option value="EUR">EUR</option>
                <option value="INR">INR</option>
                <option value="USD">USD</option>
                <option value="JPY">JPY</option>
            </select><br><br>
            <input style="margin-left: 100px;" type="button" value="Convert" onclick="convertCurrency()">
        </div>
    </form>
    <br><br>
    <div id="result"><p>--</p>
    </div>
    <p id="madeby">made while feeling sleepy by <a>Atharv Kulkarni</a></p>
    <script>
        function convertCurrency() {
            var amount = document.getElementById("amount").value;
            var fromCurrency = document.getElementById("fromCurrency").value;
            var toCurrency = document.getElementById("toCurrency").value;
            var myHeaders = new Headers();
            myHeaders.append("apikey", "XNHVzOfPeIh6Lzhttqp9y8ezW6Gw1N1u");

            var requestOptions = {
              method: 'GET',
              redirect: 'follow',
              headers: myHeaders
            };

            var url = "https://api.apilayer.com/exchangerates_data/convert"+"?from=" + encodeURIComponent(fromCurrency) +"&to=" + encodeURIComponent(toCurrency) +"&amount=" + encodeURIComponent(amount);


            fetch(url, requestOptions)
              .then(response => response.text())
              .then(result => {
                var jsonobj = JSON.parse(result)
                console.log(jsonobj);
                document.getElementById("result").innerHTML = jsonobj["result"];
                console.log(typeof result["result"])
              })
              .catch(error => console.log('error', error));
        }
    </script>
</body>
</html>
