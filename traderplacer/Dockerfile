FROM jboss/wildfly:20.0.1.Final

COPY ROOT.war /opt/jboss/wildfly/standalone/deployments
COPY app-entrypoint.sh /tmp/
COPY 1629454202808825958 /tmp/efs/snap/1629454202808825958
COPY standalone.sh /opt/jboss/wildfly/bin

USER root
RUN chown -R jboss:jboss /tmp/efs
USER jboss

ENTRYPOINT ["/tmp/app-entrypoint.sh"]