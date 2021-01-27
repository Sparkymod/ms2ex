alias Ms2ex.{Characters, Color, Equips, Inventory, ItemColor, SkinColor, Users}
alias Inventory, as: Items
alias Items.Item

{:ok, account} =
  Users.create(%{
    username: "icra",
    password: "123456"
  })

hair_color =
  ItemColor.build(
    Color.build(47, 47, -86, -1),
    Color.build(-37, -123, 76, -1),
    Color.build(19, 19, 96, -1),
    0
  )

hair =
  Items.load_metadata(%Item{
    item_id: 10_200_001,
    color: hair_color,
    data: %Item.Hair{back_length: 1_065_353_216, front_length: 1_065_353_216}
  })

face_color =
  ItemColor.build(
    Color.build(41, 36, -75, -1),
    Color.build(-29, -29, -9, -1),
    Color.build(2, 7, 20, -1),
    0
  )

face = Items.load_metadata(%Item{item_id: 10_300_014, color: face_color})

face_decor = Items.load_metadata(%Item{item_id: 10_400_002, data: String.duplicate(<<0>>, 16)})

top_color =
  ItemColor.build(
    Color.build(41, 36, -75, -1),
    Color.build(-29, -29, -9, -1),
    Color.build(2, 7, 20, -1),
    0
  )

top = Items.load_metadata(%Item{item_id: 11_400_631, color: top_color})

bottom_color =
  ItemColor.build(
    Color.build(0, 0, 0, -1),
    Color.build(0, 0, 0, -1),
    Color.build(0, 0, 0, -1),
    0
  )

bottom = Items.load_metadata(%Item{item_id: 11_500_538, color: bottom_color})

shoes_color =
  ItemColor.build(
    Color.build(51, 59, 63, -1),
    Color.build(27, 32, 35, -1),
    Color.build(15, 18, 20, -1),
    0
  )

shoes = Items.load_metadata(%Item{item_id: 11_700_709, color: shoes_color})

{:ok, char} =
  Characters.create(account, %{
    name: "icra1337",
    equipment: %{},
    map_id: 2_000_023,
    position: {-39, -4347, 9001},
    job: :wizard,
    skin_color:
      SkinColor.build(
        Color.build(-82, -65, -22, -1),
        Color.build(-82, -65, -22, -1)
      )
  })

{:ok, {:create, item}} = Inventory.add_item(char, hair)
{:ok, _equip} = Equips.set_equip(char, item)

{:ok, {:create, item}} = Inventory.add_item(char, face)
{:ok, _equip} = Equips.set_equip(char, item)

{:ok, {:create, item}} = Inventory.add_item(char, face_decor)
{:ok, _equip} = Equips.set_equip(char, item)

{:ok, {:create, item}} = Inventory.add_item(char, top)
{:ok, _equip} = Equips.set_equip(char, item)

{:ok, {:create, item}} = Inventory.add_item(char, bottom)
{:ok, _equip} = Equips.set_equip(char, item)

{:ok, {:create, item}} = Inventory.add_item(char, shoes)
{:ok, _equip} = Equips.set_equip(char, item)