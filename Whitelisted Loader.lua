local key = "key1"

local serverResponse = syn.request({
    Url = "https://glxwhitelist.000webhostapp.com/auth.php?key="..key, 
    Method = "GET",
    Headers = {
        Syn-Fingerprint = ""
    }
})

if serverResponse.StatusCode == 200 then
    print("Request was successfully sent to the verification server!")
else
    print("There was error while trying to reach verification server!")
end

print(serverResponse.Body)