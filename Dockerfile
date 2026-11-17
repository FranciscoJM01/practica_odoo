FROM odoo:18.0
USER root
COPY ./custom_addons /mnt/extra-addons
RUN chown -R odoo:odoo /mnt/extra-addons
USER odoo
ENV PGSSLMODE=require
EXPOSE 7860
CMD ["odoo", "--http-port=7860", "--addons-path=/usr/lib/python3/dist-packages/odoo/addons,/mnt/extra-addons", "--proxy-mode", "--db-filter=^neondb$"]