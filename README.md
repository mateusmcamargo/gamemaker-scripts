# gamemaker-scripts
### scripts que eu criei para projetos no gamemaker.

## draw.gml
### Configura todos os principais parâmetros para o draw event.

## animation_stop.gml
### Controla quando a animação deve parar: imediatamente ou no último frame.

## items.gml
### Retorna a struct de um item.
### Estrutura:
>> item_struct(name, sprite, object, collected, [ui_sprite]);
>> - **name:**      {string}  nome do item;
>> - **sprite:**    {sprite}  sprite do item;
>> - **object:**    {object}  objeto do item;
>> - **collected:** {boolean} se foi coletado;
>> - **ui_sprite:** {srpite}  sprite exibido na UI.

## screenshake.gml
### cria um efeito de screenshake quando chamado em um objeto próprio
### Estrutura:
>> screenshake(magnitude, time, fade);
>> - **magnitude:** {real}  força do efeito;
>> - **time:**      {real}  duração do efeito;
>> - **fade:**      {real}  velocidade com que o efeito diminui.

## sprite_change.gml
### muda o sprite de um objeto e garante que a animação comece no primeiro frame, com a velocidade padrão
### Estrutura:
>> sprite_change(sprite);
>> - **sprite:** {sprite}  novo sprite;
