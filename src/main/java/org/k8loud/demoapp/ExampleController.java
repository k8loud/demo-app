package org.k8loud.demoapp;

import io.prometheus.client.CollectorRegistry;
import io.prometheus.client.Gauge;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ExampleController {
    private final Gauge gauge;
    private final RequestService requestService;

    public ExampleController(CollectorRegistry registry, RequestService requestService) {
        this.gauge = Gauge.build()
                .help("demo_app_metric")
                .name("demo_app_metric")
                .labelNames("origin")
                .register(registry);
        this.requestService = requestService;
    }


    @GetMapping("/")
    public String index(HttpServletRequest request) {
        String remoteAddress = requestService.getClientIp(request);
        gauge.labels(remoteAddress).inc();
        return "Greetings from Spring Boot!";
    }

}