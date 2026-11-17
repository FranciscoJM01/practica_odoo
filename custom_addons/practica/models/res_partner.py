from odoo import fields, models


class ResPartner(models.Model):
    # Toma el modelo de Contactos que ya existe...
    _inherit = 'res.partner'

    # ...y agrégale este campo nuevo
    cumpleanos = fields.Date(string='Cumpleaños')
