mass_deauth
===========

Capturing the 4-way handshake required to crack WPA-PSK can be a bit frustrating when you can’t get a client to deauthenticate and reauthenticate with the access point. One option is to deauthenticate all the clients by not providing the client’s MAC address when running the deauthentication attack. 

This is a bit overkill since you might not want to knock out all the clients on the network when performing an audit. The alternative is to target different clients and hope one of them deauthenticates and reauthenticates. This can be time consuming as you’ll be picking one client, trying it, then picking another if it doesn’t work.

To solve this problem, I’ve written a little script that lets you deauthenticate several targeted clients and increases your chances of the deauthentication attack working.

For more details, see [http://blog.techorganic.com/2010/12/20/capturing-the-wpa-handshake-using-mass-deauthentication/](http://blog.techorganic.com/2010/12/20/capturing-the-wpa-handshake-using-mass-deauthentication/)
