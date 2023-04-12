from django.contrib import admin

from main.models import FotoGeral


class ListandoFotoGeral(admin.ModelAdmin):
    list_display = ('id', 'nome')
    list_display_links = ('id', 'nome')
    search_fields = ('nome', )

admin.site.register(FotoGeral, ListandoFotoGeral)
