import 'package:googleapis_auth/auth_io.dart';

class GetServerKeySevice {
  Future<String> getServerKeyToken() async {
    final scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];

    final client = await clientViaServiceAccount(
      ServiceAccountCredentials.fromJson({
        "type": "service_account",
        "project_id": "pickuplines-82369",
        "private_key_id": "8db506b330b0746fdc2274fe43efb9aefffb8ea2",
        "private_key":
            "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCbydABSSx2xmtr\nvDUkRCCEoL/y9QfALRVyltBB2CoRVCBk16voN5ppl0Tf9gZ+oPi8LRZdPsi5AFqi\nbyxg7FM5Osoe5UDWtQnOA24Ry5hAJCR1A9qIlAPnHFygJDQ4xODfq5CpJ7v44vI+\nTZePz0M/FxoZzJPAd+rMZenvD72ftxSMjdoD3GCqvm/REBtSxRQ5sGIlCNXhlTbp\nSOIVgzFhnLFVfXErSa1wmagQOwYMieXlaJZdFVKoB6rw83KD32jhtukrpmixhUpe\n2LOOgFseKr5BdKsUvcd0K1JdJj/hPu8rGujc2LbV69DWNsak17ctVqKUJoWIt3+u\nJh/4TIV7AgMBAAECggEAGYEDfYJmNhertFp+dK52iF/srLCykSKQVU8dTvo9gNK9\n7uRj70NTEyBBlUyoqYhe0Cetdpx1rdvB+r+qiz+FLGRUfJRZdgzzSvfCyEUFatK/\n6Sw1VZCtxuMcwtbKedS5X8StjRPFMSyuLcb0HgX3Y1e73SdhtOus08OHdaylBYVp\nAxaSoRNjRym2mh2axfyzRMFrsTTGBtSmrMmlboagXHHKU4QepoBUymIKaflKh5TK\nYYnuwApqEGwvBv6oK68RDMgcjWqSCbF9DNo1mnIouZMP7ZSb+P4qmUXNg4hjt8qr\nQ1jSi4u7PrP41R76+JcXyAGuAfKjU0s0dMSZ5MVDeQKBgQDJJyHAnHrJog8nxsZx\ni6wq/gaQL8IhMDqPSskp1V+gAG6Em7YxL1/PbZth8f8am96yRf3flRj/pDTspzB8\nYmNDsrzsp3bsy+u1dK3OkQmFM7kTSgPb+PDdigix6hyIbMexSBeVOCI2QkA8rB7K\nojVhff4ajIQX7fSwUs0u9UnwZQKBgQDGRCWM3507ooOTD9ei3i7bT7zNbvpSlmxY\n5IWhxRCT3ALNOni4iWIeFYl1GWW8OR0c5kySOjnhzOoFPsT2N9YtcWBpbV8xu2DG\nm68YUohklZ/yAgu4852t92RkPbxazM/uHtpuqywp56d8X4u61V59gX+pkBPg7J0p\n+tqbmx4QXwKBgE8FsnrKfmpL4gxMSJU+u6pAFS/7sxX6rmawiIqIqoJe6QvraA22\ngLsqYgp+WSuI5FnAqVV2a1WymqAFpkSXGkv0IcgOmee4zKaCae1miQjtIt3zC8UU\n7Pr7SSMrx33IzkJVAf67CKWsLTQooggU5UehiXvAi/winSfPv4+dCSkJAoGBAI2/\nlPUlvl0vcFBJCEtJ/EgRtxNM360CHI5lO2EP6i08I8ikoECXAE4v6amNsd2jG7xY\nrq/w7wcPoNSFLv41p2uv3lUhu+hrZeI41jNWdmsrSkIU0lq12arR77V3Kd3lBlfh\nORvcR2PiWi0ihlzaRYcHecU52+x4XljwHzEW8qSTAoGAaRKS6Nz0/uyJawOWLpZK\nPIFXxtq9BucURD8ys4Eod4WTYu7NY2MfuG7XVh/hqVD7Ucssl9laqCSrtl/Qkfy4\nmM0Tl+b4u2TJfZbjGAvAYgjprAoThJju1pgXZ4QJxU4iaQmmjbD86X9xi+coHwFu\nqd3R4htwmMBkWVC1dpJScSg=\n-----END PRIVATE KEY-----\n",
        "client_email":
            "firebase-adminsdk-xjpdf@pickuplines-82369.iam.gserviceaccount.com",
        "client_id": "103366589644115370399",
        "auth_uri": "https://accounts.google.com/o/oauth2/auth",
        "token_uri": "https://oauth2.googleapis.com/token",
        "auth_provider_x509_cert_url":
            "https://www.googleapis.com/oauth2/v1/certs",
        "client_x509_cert_url":
            "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-xjpdf%40pickuplines-82369.iam.gserviceaccount.com",
        "universe_domain": "googleapis.com",
      }),
      scopes,
    );
    final accessServerKey = client.credentials.accessToken.data;
    return accessServerKey;
  }
}
