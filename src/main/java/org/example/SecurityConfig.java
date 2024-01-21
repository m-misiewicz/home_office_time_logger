package org.example;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {
    @Bean
    public static PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration) throws Exception {
        return configuration.getAuthenticationManager();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//        return http.authorizeRequests()
//                .antMatchers("/api/signup", "/api/login").permitAll() // Allow access to signup and login
//                .antMatchers("/api/landing").authenticated() // Require authentication for landing
//                .and().formLogin().loginPage("/api/login").defaultSuccessUrl("/api/landing", true)
//                .permitAll().and().build();
        http.csrf().disable()
                .authorizeRequests()
                .antMatchers("/api/signup", "/api/login").permitAll()
                .antMatchers("/api/landing").authenticated()
                .anyRequest().authenticated()
                .and()
                .formLogin()
                .loginPage("/api/login")
                .defaultSuccessUrl("/api/landing", true)
                .permitAll()
                .and()
                .logout()
                .permitAll();
        http.headers().frameOptions().disable();
        return http.build();
    }
}
