package dreammungz.config.jwt;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;

/*
@author 황승주
@since 2022. 09. 11.
*/

@Service
public class JwtService {
    private String secretKey = "dreammungz";

    static final long ACCESS_PERIOD = 1000L * 60L * 60L * 24L;

    static final String DATE_FORMAT = "yyyy-MM-dd-HH-mm-ss";

    @PostConstruct
    protected void init() {
        secretKey = Base64.getEncoder().encodeToString(secretKey.getBytes());
    }

    public Jwt generateToken(String address) {

        Claims claims = Jwts.claims().setSubject("token");
        claims.put("address", address);

        Date now = new Date();
        return new Jwt(
                Jwts.builder()
                        .setClaims(claims)
                        .setIssuedAt(now)
                        .setExpiration(new Date(now.getTime() + ACCESS_PERIOD))
                        .signWith(SignatureAlgorithm.HS256, secretKey)
                        .compact());
    }

    public boolean verifyToken(String token) {
        try {
            Jws<Claims> claims = Jwts.parser()
                    .setSigningKey(secretKey)
                    .parseClaimsJws(token);
            return claims.getBody()
                    .getExpiration()
                    .after(new Date());
        } catch (Exception e) {
            return false;
        }
    }

    public String getAddress(String token) {
        return (String) Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token).getBody().get("address");
    }

    public Date getExpiration(String token) {
        return (Date) Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token).getBody().getExpiration();
    }

    public String dateToString(String token) {
        DateFormat expirationFormat = new SimpleDateFormat(DATE_FORMAT);
        Date tokenExpirationDate = getExpiration(token);
        return expirationFormat.format(tokenExpirationDate);
    }
}
