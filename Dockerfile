FROM odoo:18.0
USER root
COPY ./custom_addons /mnt/extra-addons
RUN chown -R odoo:odoo /mnt/extra-addons
USER odoo
ENV PGSSLMODE=require
EXPOSE 8000
CMD ["sh", "-c", "odoo --db_host=$HOST --db_port=5432 --db_user=$USER --db_password=$PASSWORD -d unicah_final -i base,practica --without-demo=all --stop-after-init --workers=0 --max-cron-threads=0 --addons-path=/usr/lib/python3/dist-packages/odoo/addons,/mnt/extra-addons && exec odoo --http-port=${PORT:-8000} --db_host=$HOST --db_port=5432 --db_user=$USER --db_password=$PASSWORD -d unicah_final --db-filter=^unicah_final$ --without-demo=all --workers=0 --max-cron-threads=0 --addons-path=/usr/lib/python3/dist-packages/odoo/addons,/mnt/extra-addons --proxy-mode"]