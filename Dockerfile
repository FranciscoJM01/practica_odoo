FROM odoo:18.0
USER root
COPY ./custom_addons /mnt/extra-addons
RUN chown -R odoo:odoo /mnt/extra-addons
USER odoo
ENV PGSSLMODE=require
EXPOSE 10000
CMD ["sh", "-c", "odoo --http-port= --db_host=System.Management.Automation.Internal.Host.InternalHost --db_port=5432 --db_user= --db_password= -d neondb -i base,practica --without-demo=all --workers=0 --limit-memory-soft=400000000 --limit-memory-hard=512000000 --addons-path=/usr/lib/python3/dist-packages/odoo/addons,/mnt/extra-addons --proxy-mode --db-filter=^neondb$"]