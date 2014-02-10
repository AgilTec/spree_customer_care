Deface::Override.new(virtual_path: "spree/layouts/spree_application",
                     insert_bottom: "body",
                     partial: "shared/customer_assistant",
                     name: "customer_assistant")
