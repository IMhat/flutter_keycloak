# keycloakflutter

A Sample Flutter App for integrating keycloak server as identity provider


## Constant Variables

To run this project, you will need to add the following Constant variables to your `helper/constants.dart` file

`AUTH_DOMAIN`

`AUTH_CLIENT_ID`

`AUTH_ISSUER`

`BUNDLE_IDENTIFIER`

`AUTH_REDIRECT_URI`

`AUTH_REFRESH_TOKEN_KEY`

`AUTH_REALMS`
## Documentation

### Android
For successfully redirect back to application after login we need to set some properties inside android `build.gradle` (app)

**Make sure there is no underscore (_) in `'appAuthRedirectScheme'` and there is "+=" not only "="**

``` yml
manifestPlaceholders += [
    'appAuthRedirectScheme': 'me.smitppatel35.keycloakflutter' <= This is the Package name in my case
]
```

### ios
For successfully redirect back to application after login we need to set some properties inside `runner/info.plist`

**Make sure to change package name**

``` xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
    	<key>CFBundleTypeRole</key>
    	<string>Editor</string>
    	<key>CFBundleURLScheme</key>
    	<array>
    		<string>me.smitppatel35.keycloakflutter</string>
    	</array>
    </dict>
</array>
```