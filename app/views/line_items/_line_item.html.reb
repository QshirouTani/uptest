
	<% if line_item == @current_item %>
	<tr id = "current_item">
	<% else %>
	<tr>
	<% end %>
		<td><%= line_item.quantity %> &times; </td>
		<td><%= line_item.product.title %></td>
		<td><class = "item_price"><%= number_to_currency(line_item.total_price) %></td>
		<td>
			<%= button_to '削除', @cart, method: :delete, data:{confirm: '削除'} %>
		</td> 
	</tr>
		